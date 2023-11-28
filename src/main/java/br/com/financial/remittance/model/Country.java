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
@Table(name = "country", schema = "remittance")
@Data
@NoArgsConstructor
public class Country {
    @Id
    @Column(name = "country_id")
    private Long countryId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "phone_code", nullable = false)
    private String phoneCode;

    @ManyToOne
    @JoinColumn(name = "currency_id")
    private Currency currency;
}
