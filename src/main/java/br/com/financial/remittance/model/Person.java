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
public class Person {
    @Id
    private Long personId;

    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String cellphone;
    private LocalDate birthDate;
    private String document;

    @OneToOne
    private User userId;
    @ManyToOne
    private DocumentType docTypeId;
}
