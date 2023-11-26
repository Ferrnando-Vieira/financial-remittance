package br.com.financial.remittance.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class DocumentType {
    @Id
    private Long docTypeId;

    private String description;

    @ManyToOne
    private Country country;
}
