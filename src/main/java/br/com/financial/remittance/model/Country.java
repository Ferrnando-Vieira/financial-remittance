package br.com.financial.remittance.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Country {
    @Id
    private Long countryId;

    private String name;
    private String phoneCode;
    private Currency currency;
}
