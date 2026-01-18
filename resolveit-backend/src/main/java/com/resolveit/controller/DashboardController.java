package com.resolveit.controller;

import com.resolveit.repository.ComplaintRepository;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/dashboard")
@CrossOrigin
public class DashboardController {

    private final ComplaintRepository complaintRepository;

    public DashboardController(ComplaintRepository complaintRepository) {
        this.complaintRepository = complaintRepository;
    }

    @GetMapping("/stats")
    public Map<String, Long> getStats() {
        Map<String, Long> stats = new HashMap<>();

        long total = complaintRepository.count();
        long resolved = complaintRepository.countByStatus_Code("RESOLVED");
        long pending = total - resolved;

        stats.put("total", total);
        stats.put("pending", pending);
        stats.put("resolved", resolved);

        return stats;
    }
}
