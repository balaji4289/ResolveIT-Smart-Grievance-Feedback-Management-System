package com.resolveit.controller;

import com.resolveit.dto.UpdateStatusRequest;
import com.resolveit.model.Complaint;
import com.resolveit.model.ComplaintStatus;
import com.resolveit.model.User;
import com.resolveit.repository.ComplaintRepository;
import com.resolveit.repository.ComplaintStatusRepository;
import com.resolveit.repository.UserRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/complaints")
@CrossOrigin(origins = "http://localhost:3000")
public class ComplaintController {

    private final ComplaintRepository complaintRepository;
    private final UserRepository userRepository;
    private final ComplaintStatusRepository statusRepository;

    public ComplaintController(
            ComplaintRepository complaintRepository,
            UserRepository userRepository,
            ComplaintStatusRepository statusRepository
    ) {
        this.complaintRepository = complaintRepository;
        this.userRepository = userRepository;
        this.statusRepository = statusRepository;
    }

    /* ================= USER APIs ================= */

    // ✅ CREATE COMPLAINT (USER)
    @PostMapping
    public Complaint createComplaint(
            @RequestBody Complaint complaint,
            @AuthenticationPrincipal UserDetails userDetails
    ) {
        User user = userRepository.findByEmail(userDetails.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found"));

        ComplaintStatus openStatus = statusRepository.findByCode("OPEN")
                .orElseThrow(() -> new RuntimeException("OPEN status missing"));

        complaint.setUser(user);
        complaint.setStatus(openStatus);
        complaint.setCreatedAt(LocalDateTime.now());
        complaint.setUpdatedAt(LocalDateTime.now());

        return complaintRepository.save(complaint);
    }

    // ✅ GET MY COMPLAINTS (USER)
    @GetMapping("/my")
    public List<Complaint> getMyComplaints(
            @AuthenticationPrincipal UserDetails userDetails
    ) {
        User user = userRepository.findByEmail(userDetails.getUsername())
                .orElseThrow(() -> new RuntimeException("User not found"));

        return complaintRepository.findByUser(user);
    }

    // ✅ GET SINGLE COMPLAINT (USER or ADMIN)
    @GetMapping("/{id}")
    public Complaint getComplaintById(@PathVariable Long id) {
        return complaintRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Complaint not found"));
    }

    /* ================= ADMIN APIs ================= */

    // ✅ GET ALL COMPLAINTS (ADMIN)
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/admin/all")
    public List<Complaint> getAllComplaints() {
        return complaintRepository.findAll();
    }

    // ✅ GET SINGLE COMPLAINT (ADMIN)
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/admin/{id}")
    public Complaint getComplaintByIdForAdmin(@PathVariable Long id) {
        return complaintRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Complaint not found with id: " + id)
                );
    }

    // ✅ UPDATE STATUS (ADMIN)
    @PreAuthorize("hasRole('ADMIN')")
    @PatchMapping("/admin/{id}/status")
    public Complaint updateComplaintStatus(
            @PathVariable Long id,
            @RequestBody UpdateStatusRequest request
    ) {
        Complaint complaint = complaintRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Complaint not found"));

        ComplaintStatus status = statusRepository
                .findByCode(request.getStatusCode())
                .orElseThrow(() -> new RuntimeException("Invalid status code"));

        complaint.setStatus(status);
        complaint.setUpdatedAt(LocalDateTime.now());

        return complaintRepository.save(complaint);
    }

    // ✅ DASHBOARD STATS (ADMIN) — USED BY HOME PAGE
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/admin/stats")
    public Map<String, Long> getComplaintStats() {

        long total = complaintRepository.count();
        long open = complaintRepository.countByStatus_Code("OPEN");
        long resolved = complaintRepository.countByStatus_Code("RESOLVED");

        Map<String, Long> stats = new HashMap<>();
        stats.put("total", total);
        stats.put("pending", open);
        stats.put("resolved", resolved);

        return stats;
    }
}
