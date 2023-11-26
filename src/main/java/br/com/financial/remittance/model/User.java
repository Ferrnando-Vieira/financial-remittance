package br.com.financial.remittance.model;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class User {
    @Id
    private Long userId;
    
    private String username;
    private String password;
    private boolean isEnabled;
    private boolean isLegalEntity;
    private LocalDateTime dtHourCreation;
}
