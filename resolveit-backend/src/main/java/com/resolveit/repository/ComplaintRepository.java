package com.resolveit.repository;

import com.resolveit.model.Complaint;
import com.resolveit.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ComplaintRepository extends JpaRepository<Complaint, Long> {

    // For "My Complaints"
    List<Complaint> findByUser(User user);

    // For Dashboard stats
    long countByStatus_Code(String code);
}
