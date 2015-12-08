package com.test.sceditor.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "sc_relation")
public class ScRelation {
    @Id
    @Column(name = "id")
    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "node_name")
    @NotNull
    private String nodeName;

    @Column(name = "rus")
    @NotNull
    private String rus;

    @Column(name = "eng")
    @NotNull
    private String eng;

    public ScRelation() {
    }

    public ScRelation(String nodeName, String rus, String eng) {
        this.nodeName = nodeName;
        this.rus = rus;
        this.eng = eng;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public String getRus() {
        return rus;
    }

    public void setRus(String rus) {
        this.rus = rus;
    }

    public String getEng() {
        return eng;
    }

    public void setEng(String eng) {
        this.eng = eng;
    }
}

