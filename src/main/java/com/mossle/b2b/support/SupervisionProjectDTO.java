package com.mossle.b2b.support;

public class SupervisionProjectDTO {
    private String id;
    private String name;
    private String status; // 进行中, 整改中
    private String statusType; // success, warning
    private String location;
    private String director;
    private int safetyScore;
    private String safetyScoreType; // success, warning

    public SupervisionProjectDTO() {}

    public SupervisionProjectDTO(String id, String name, String status, String statusType, String location, String director, int safetyScore, String safetyScoreType) {
        this.id = id;
        this.name = name;
        this.status = status;
        this.statusType = statusType;
        this.location = location;
        this.director = director;
        this.safetyScore = safetyScore;
        this.safetyScoreType = safetyScoreType;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getStatusType() { return statusType; }
    public void setStatusType(String statusType) { this.statusType = statusType; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }
    public int getSafetyScore() { return safetyScore; }
    public void setSafetyScore(int safetyScore) { this.safetyScore = safetyScore; }
    public String getSafetyScoreType() { return safetyScoreType; }
    public void setSafetyScoreType(String safetyScoreType) { this.safetyScoreType = safetyScoreType; }
}
