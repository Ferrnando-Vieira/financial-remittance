package br.com.financial.remittance.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "currency", schema = "remittance")
@NoArgsConstructor
public class Currency {
    @Id
    @Column(name = "currency_id", nullable = false)
    private Long currencyId;

    @Column(name = "description", nullable = false)
    private String description;

    @Column(name = "code", nullable = false)
    private String code;
    
}
