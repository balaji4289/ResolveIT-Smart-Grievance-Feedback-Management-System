package com.resolveit.service;

import com.resolveit.model.Attachment;
import com.resolveit.model.Complaint;
import com.resolveit.model.User;
import com.resolveit.repository.AttachmentRepository;
import com.resolveit.repository.ComplaintRepository;
import com.resolveit.repository.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public class AttachmentService {

    private final AttachmentRepository attachmentRepository;
    private final ComplaintRepository complaintRepository;
    private final UserRepository userRepository;
    private final FileStorageService fileStorageService;

    public AttachmentService(
            AttachmentRepository attachmentRepository,
            ComplaintRepository complaintRepository,
            UserRepository userRepository,
            FileStorageService fileStorageService
    ) {
        this.attachmentRepository = attachmentRepository;
        this.complaintRepository = complaintRepository;
        this.userRepository = userRepository;
        this.fileStorageService = fileStorageService;
    }

    /* ========= UPLOAD ========= */
    @Transactional
    public void uploadFiles(
            Long complaintId,
            List<MultipartFile> files,
            String email,
            boolean isAdmin
    ) {

        Complaint complaint = complaintRepository.findById(complaintId)
                .orElseThrow(() -> new RuntimeException("Complaint not found"));

        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // 🔒 Ownership check
        if (!isAdmin && !complaint.getUser().getId().equals(user.getId())) {
            throw new AccessDeniedException("You are not allowed to upload files to this complaint");
        }

        for (MultipartFile file : files) {
            if (file.isEmpty()) continue;

            try {
                String path = fileStorageService.saveFile(file);

                Attachment attachment = new Attachment();
                attachment.setComplaint(complaint);
                attachment.setFilename(file.getOriginalFilename());
                attachment.setFilePath(path);

                attachmentRepository.save(attachment);

            } catch (IOException e) {
                throw new RuntimeException("Failed to upload file", e);
            }
        }
    }

    /* ========= GET ========= */
    public List<Attachment> getAttachmentsForComplaint(
            Long complaintId,
            String email,
            boolean isAdmin
    ) {

        Complaint complaint = complaintRepository.findById(complaintId)
                .orElseThrow(() -> new RuntimeException("Complaint not found"));

        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // 🔒 Ownership check
        if (!isAdmin && !complaint.getUser().getId().equals(user.getId())) {
            throw new AccessDeniedException("You are not allowed to view attachments of this complaint");
        }

        return attachmentRepository.findByComplaintId(complaintId);
    }
}
