//package com.resolveit.controller;
//
//import com.resolveit.dto.UpdateStatusRequest;
//import com.resolveit.model.Complaint;
//import com.resolveit.repository.ComplaintRepository;
//import com.resolveit.service.ComplaintService;
//import org.springframework.security.access.prepost.PreAuthorize;
//import org.springframework.security.core.annotation.AuthenticationPrincipal;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.web.bind.annotation.*;
//
//@RestController
//@RequestMapping("/complaints/admin")
//@PreAuthorize("hasRole('ADMIN')")
//public class ComplaintAdminController {
//
//    private final ComplaintRepository complaintRepository;
//    private final ComplaintService complaintService;
//
//    public ComplaintAdminController(
//            ComplaintRepository complaintRepository,
//            ComplaintService complaintService
//    ) {
//        this.complaintRepository = complaintRepository;
//        this.complaintService = complaintService;
//    }
//
//    @GetMapping("/{id}")
//    public Complaint getComplaint(@PathVariable Long id) {
//        return complaintRepository.findById(id)
//                .orElseThrow(() -> new RuntimeException("Complaint not found"));
//    }
//
//    @PatchMapping("/{id}/status")
//    public String updateStatus(
//            @PathVariable Long id,
//            @RequestBody UpdateStatusRequest request,
//            @AuthenticationPrincipal UserDetails admin
//    ) {
//        complaintService.updateStatus(id, request.getStatusCode());
//        return "Status updated successfully";
//    }
//}
