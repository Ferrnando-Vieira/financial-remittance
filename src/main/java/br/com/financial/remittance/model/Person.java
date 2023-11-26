package br.com.financial.remittance.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
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
    private String celphone;
    private LocalDate birthDate;
    private String document;
    private DocumentType documentType;
}