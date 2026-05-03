package com.nirvachansetu.model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * Represents an approved Candidate participating in an election.
 */
@Entity
@Table(name = "candidates")
public class Candidate implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false, unique = true)
    private User user;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "application_id", nullable = false, unique = true)
    private CandidateApplication application;

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
    private CandidateApplication.PartyType partyType;

    @Column(columnDefinition = "TEXT")
    private String manifesto;

    @Column(length = 100)
    private String symbol;

    @Column(name = "total_votes")
    private Integer totalVotes = 0;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private CandidateStatus status = CandidateStatus.ACTIVE;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public enum CandidateStatus {
        ACTIVE, DISQUALIFIED, WITHDRAWN
    }

    /**
     * Default no-argument constructor required by JPA.
     */
    public Candidate() {
    }

    /**
     * Parameterized constructor to initialize a Candidate.
     * 
     * @param user         the user who is the candidate
     * @param application  the approved candidate application
     * @param election     the election the candidate is participating in
     * @param constituency the constituency the candidate belongs to
     */
    public Candidate(User user, CandidateApplication application, Election election, Constituency constituency) {
        this.user = user;
        this.application = application;
        this.election = election;
        this.constituency = constituency;
    }

    /**
     * Called before persisting the entity. Initializes the creation and update timestamps.
     */
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    /**
     * Called before updating the entity. Updates the update timestamp.
     */
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

    public CandidateApplication getApplication() {
        return application;
    }

    public void setApplication(CandidateApplication application) {
        this.application = application;
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

    public CandidateApplication.PartyType getPartyType() {
        return partyType;
    }

    public void setPartyType(CandidateApplication.PartyType partyType) {
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

    public Integer getTotalVotes() {
        return totalVotes;
    }

    public void setTotalVotes(Integer totalVotes) {
        this.totalVotes = totalVotes;
    }

    public CandidateStatus getStatus() {
        return status;
    }

    public void setStatus(CandidateStatus status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Candidate{" +
                "id=" + id +
                ", user=" + (user != null ? user.getFullName() : "null") +
                ", partyName='" + partyName + '\'' +
                ", totalVotes=" + totalVotes +
                ", status=" + status +
                '}';
    }
}
