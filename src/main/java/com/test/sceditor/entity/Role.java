package com.test.sceditor.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "roles")
public class Role {
    @Id
    @Column(name = "id")
    @NotNull
    private int id;

    @Column(name = "value")
    @NotNull
    private String value;

    public Role(String value) {
        this.value = value;
    }

    public Role() {
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
