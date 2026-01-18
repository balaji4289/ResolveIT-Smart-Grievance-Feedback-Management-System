package com.resolveit.controller;

import com.resolveit.model.Attachment;
import com.resolveit.service.AttachmentService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/attachments")
@CrossOrigin
public class AttachmentController {

    private final AttachmentService attachmentService;

    public AttachmentController(AttachmentService attachmentService) {
        this.attachmentService = attachmentService;
    }

    /* ========= UPLOAD ========= */
    @PostMapping("/{complaintId}")
    public ResponseEntity<?> upload(
            @PathVariable Long complaintId,
            @RequestParam("files") List<MultipartFile> files,
            Authentication authentication
    ) {

        String email = authentication.getName(); // ✅ SAFE
        boolean isAdmin = authentication.getAuthorities()
                .stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

        attachmentService.uploadFiles(complaintId, files, email, isAdmin);
        return ResponseEntity.ok("Files uploaded successfully");
    }

    /* ========= GET ========= */
    @GetMapping("/{complaintId}")
    public ResponseEntity<?> getAttachments(
            @PathVariable Long complaintId,
            Authentication authentication
    ) {

        String email = authentication.getName(); // ✅ SAFE
        boolean isAdmin = authentication.getAuthorities()
                .stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"));

        List<Attachment> attachments =
                attachmentService.getAttachmentsForComplaint(complaintId, email, isAdmin);

        return ResponseEntity.ok(attachments);
    }
}
