package br.com.financial.remittance.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class LegalEntity {
    @Id
    private Long legalEntityId;

    private String fullName;
    private String document;
    private LocalDate dtLegalEntityCreation;
    
    @ManyToOne
    private DocumentType docTypeId;
    @OneToOne
    private User userId;
}
