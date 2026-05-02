package com.nirvachansetu.model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Entity
@Table(name = "candidate_applications", uniqueConstraints = {
        @UniqueConstraint(name = "unique_application", columnNames = {"user_id", "election_id"})
})
public class CandidateApplication implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "election_id", nullable = false)
    private Election election;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "constituency_id", nullable = false)
    private Constituency constituency;

    @Column(name = "party_name", length = 200)
    private String partyName;

    @Enumerated(EnumType.STRING)
    @Column(name = "party_type", length = 20)
    private PartyType partyType = PartyType.INDEPENDENT;

    @Column(columnDefinition = "TEXT")
    private String manifesto;

    @Column(length = 100)
    private String symbol;

    @Column(name = "id_proof_path", length = 500)
    private String idProofPath;

    @Column(name = "declaration_path", length = 500)
    private String declarationPath;

    @Column(name = "party_evidence_path", length = 500)
    private String partyEvidencePath;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private ApplicationStatus status = ApplicationStatus.PENDING;

    @Column(name = "applied_at", updatable = false)
    private LocalDateTime appliedAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public enum PartyType {
        NATIONAL, REGIONAL, INDEPENDENT
    }

    public enum ApplicationStatus {
        PENDING, APPROVED, REJECTED, WITHDRAWN
    }

    public CandidateApplication() {
    }

    public CandidateApplication(User user, Election election, Constituency constituency) {
        this.user = user;
        this.election = election;
        this.constituency = constituency;
    }

    @PrePersist
    protected void onCreate() {
        appliedAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Election getElection() {
        return election;
    }

    public void setElection(Election election) {
        this.election = election;
    }

    public Constituency getConstituency() {
        return constituency;
    }

    public void setConstituency(Constituency constituency) {
        this.constituency = constituency;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public PartyType getPartyType() {
        return partyType;
    }

    public void setPartyType(PartyType partyType) {
        this.partyType = partyType;
    }

    public String getManifesto() {
        return manifesto;
    }

    public void setManifesto(String manifesto) {
        this.manifesto = manifesto;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public ApplicationStatus getStatus() {
        return status;
    }

    public void setStatus(ApplicationStatus status) {
        this.status = status;
    }

    public String getIdProofPath() {
        return idProofPath;
    }

    public void setIdProofPath(String idProofPath) {
        this.idProofPath = idProofPath;
    }

    public String getDeclarationPath() {
        return declarationPath;
    }

    public void setDeclarationPath(String declarationPath) {
        this.declarationPath = declarationPath;
    }

    public String getPartyEvidencePath() {
        return partyEvidencePath;
    }

    public void setPartyEvidencePath(String partyEvidencePath) {
        this.partyEvidencePath = partyEvidencePath;
    }

    public LocalDateTime getAppliedAt() {
        return appliedAt;
    }

    public void setAppliedAt(LocalDateTime appliedAt) {
        this.appliedAt = appliedAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getAppliedAtFormatted() {
        if (appliedAt != null) {
            return appliedAt.format(DateTimeFormatter.ofPattern("MMMM d, yyyy"));
        }
        return "";
    }

    @Override
    public String toString() {
        return "CandidateApplication{" +
                "id=" + id +
                ", user=" + (user != null ? user.getFullName() : "null") +
                ", election=" + (election != null ? election.getName() : "null") +
                ", partyName='" + partyName + '\'' +
                ", status=" + status +
                '}';
    }
}
