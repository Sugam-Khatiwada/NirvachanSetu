package com.nirvachansetu.model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Represents an Election event containing details about start/end dates and status.
 */
@Entity
@Table(name = "elections")
public class Election implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 200)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "election_type", nullable = false, length = 20)
    private ElectionType electionType = ElectionType.HOR;

    @Column(name = "start_date", nullable = false)
    private LocalDateTime startDate;

    @Column(name = "end_date", nullable = false)
    private LocalDateTime endDate;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private ElectionStatus status = ElectionStatus.DRAFT;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "constituency_id")
    private Constituency constituency;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    public enum ElectionType {
        HOR, PROVINCIAL, LOCAL
    }

    public enum ElectionStatus {
        DRAFT, REGISTRATION, ACTIVE, COMPLETED, CANCELLED
    }

    public Election() {
    }

    public Election(String name, String description, ElectionType electionType,
                    LocalDateTime startDate, LocalDateTime endDate) {
        this.name = name;
        this.description = description;
        this.electionType = electionType;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ElectionType getElectionType() {
        return electionType;
    }

    public void setElectionType(ElectionType electionType) {
        this.electionType = electionType;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public ElectionStatus getStatus() {
        return status;
    }

    public void setStatus(ElectionStatus status) {
        this.status = status;
    }

    public Constituency getConstituency() {
        return constituency;
    }

    public void setConstituency(Constituency constituency) {
        this.constituency = constituency;
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

    public String getStartDateFormatted() {
        if (startDate != null) {
            return startDate.format(DateTimeFormatter.ofPattern("MMM d, yyyy"));
        }
        return "";
    }

    public String getStartDateFull() {
        if (startDate != null) {
            return startDate.format(DateTimeFormatter.ofPattern("MMMM d, yyyy"));
        }
        return "";
    }

    public String getEndDateFormatted() {
        if (endDate != null) {
            return endDate.format(DateTimeFormatter.ofPattern("MMM d, yyyy"));
        }
        return "";
    }

    /**
     * Returns startDate formatted for HTML datetime-local input (yyyy-MM-dd'T'HH:mm).
     */
    public String getStartDateForInput() {
        if (startDate != null) {
            return startDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
        }
        return "";
    }

    /**
     * Returns endDate formatted for HTML datetime-local input (yyyy-MM-dd'T'HH:mm).
     */
    public String getEndDateForInput() {
        if (endDate != null) {
            return endDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"));
        }
        return "";
    }

    @Override
    public String toString() {
        return "Election{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", electionType=" + electionType +
                ", status=" + status +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }
}
