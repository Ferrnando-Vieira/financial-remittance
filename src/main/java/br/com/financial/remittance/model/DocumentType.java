package br.com.financial.remittance.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "document_type", schema = "remittance")
@Data
@NoArgsConstructor
public class DocumentType {
    @Id
    @Column(name = "doc_type_id")
    private Long docTypeId;

    @Column(name = "description", nullable = false)
    private String description;

    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;
}
