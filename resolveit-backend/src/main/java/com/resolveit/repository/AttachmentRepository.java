package com.resolveit.repository;

import com.resolveit.model.Attachment;
import com.resolveit.model.Complaint;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AttachmentRepository extends JpaRepository<Attachment, Long> {
    List<Attachment> findByComplaintId(Long complaintId);
}

