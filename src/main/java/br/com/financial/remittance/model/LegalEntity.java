package br.com.financial.remittance.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
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
    private DocumentType documentType;
    private LocalDate dtLegalEntityCreation;
}
