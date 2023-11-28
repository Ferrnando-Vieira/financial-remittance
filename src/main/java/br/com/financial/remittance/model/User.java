package br.com.financial.remittance.model;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "user", schema = "remittance")
@Data
@NoArgsConstructor
public class User {
    @Id
    @Column(name = "user_id")
    private Long userId;
    
    @Column(name = "username", nullable = false)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "is_enabled")
    private boolean isEnabled;

    @Column(name = "is_legal_entity")
    private boolean isLegalEntity;

    @Column(name = "dt_hour_creation", nullable = false, columnDefinition = "TIMESTAMP")
    private LocalDateTime dtHourCreation;
}
