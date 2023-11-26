package br.com.financial.remittance.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Currency {
    @Id
    private Long currencyId;

    private String description;
    
}
