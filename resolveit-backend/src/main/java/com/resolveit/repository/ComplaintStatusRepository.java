package com.resolveit.repository;

import com.resolveit.model.ComplaintStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ComplaintStatusRepository extends JpaRepository<ComplaintStatus, Integer> {

    Optional<ComplaintStatus> findByCode(String code);
}
