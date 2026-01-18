package com.resolveit.service;

import com.resolveit.model.Complaint;
import com.resolveit.model.ComplaintStatus;
import com.resolveit.repository.ComplaintRepository;
import com.resolveit.repository.ComplaintStatusRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.Set;

@Service
public class ComplaintService {

    private final ComplaintRepository complaintRepository;
    private final ComplaintStatusRepository complaintStatusRepository;

    public ComplaintService(
            ComplaintRepository complaintRepository,
            ComplaintStatusRepository complaintStatusRepository
    ) {
        this.complaintRepository = complaintRepository;
        this.complaintStatusRepository = complaintStatusRepository;
    }

    @Transactional
    public void updateStatus(Long complaintId, String statusCode) {

        Complaint complaint = complaintRepository.findById(complaintId)
                .orElseThrow(() -> new RuntimeException("Complaint not found"));

        ComplaintStatus status = complaintStatusRepository.findByCode(statusCode)
                .orElseThrow(() -> new RuntimeException("Invalid status code"));

        complaint.setStatus(status);
        complaint.setUpdatedAt(LocalDateTime.now());
        complaintRepository.save(complaint);
    }
}

