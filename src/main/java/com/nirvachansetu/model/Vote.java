package com.nirvachansetu.model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "votes", uniqueConstraints = {
        @UniqueConstraint(name = "unique_vote", columnNames = {"election_id", "voter_id"})
})
public class Vote implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "election_id", nullable = false)
    private Election election;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "candidate_id", nullable = false)
    private Candidate candidate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "constituency_id", nullable = false)
    private Constituency constituency;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "voter_id", nullable = false)
    private User voter;

    @Column(name = "voted_at", updatable = false)
    private LocalDateTime votedAt;

    public Vote() {
    }

    public Vote(Election election, Candidate candidate, Constituency constituency, User voter) {
        this.election = election;
        this.candidate = candidate;
        this.constituency = constituency;
        this.voter = voter;
    }

    @PrePersist
    protected void onCreate() {
        votedAt = LocalDateTime.now();
    }

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Election getElection() {
        return election;
    }

    public void setElection(Election election) {
        this.election = election;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }

    public Constituency getConstituency() {
        return constituency;
    }

    public void setConstituency(Constituency constituency) {
        this.constituency = constituency;
    }

    public User getVoter() {
        return voter;
    }

    public void setVoter(User voter) {
        this.voter = voter;
    }

    public LocalDateTime getVotedAt() {
        return votedAt;
    }

    public void setVotedAt(LocalDateTime votedAt) {
        this.votedAt = votedAt;
    }

    @Override
    public String toString() {
        return "Vote{" +
                "id=" + id +
                ", election=" + (election != null ? election.getName() : "null") +
                ", candidate=" + (candidate != null ? candidate.getUser().getFullName() : "null") +
                ", voter=" + (voter != null ? voter.getFullName() : "null") +
                ", votedAt=" + votedAt +
                '}';
    }
}
