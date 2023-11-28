package br.com.financial.remittance.model;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "legal_entity", schema = "remittance")
@Data
@NoArgsConstructor
public class LegalEntity {
    @Id
    @Column(name = "legal_entity_id")
    private Long legalEntityId;

    @Column(name = "full_name", nullable = false)
    private String fullName;

    @Column(name = "document", nullable = false)
    private String document;

    @Column(name = "dt_legal_entity_creation", nullable = false, columnDefinition = "DATE")
    private LocalDate dtLegalEntityCreation;
    
    @ManyToOne
    @JoinColumn(name = "doc_type_id")
    private DocumentType docTypeId;
    
    @OneToOne
    @JoinColumn(name = "user_id")
    private User userId;
}
