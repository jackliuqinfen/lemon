package com.mossle.b2b.support;

public class AgencyProjectDTO {
    private String id;
    private String name;
    private String client;
    private String manager;
    private String status; // 进行中, 审核中
    private String statusType; // success, warning
    private String fee;

    public AgencyProjectDTO() {}

    public AgencyProjectDTO(String id, String name, String client, String manager, String status, String statusType, String fee) {
        this.id = id;
        this.name = name;
        this.client = client;
        this.manager = manager;
        this.status = status;
        this.statusType = statusType;
        this.fee = fee;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getClient() { return client; }
    public void setClient(String client) { this.client = client; }
    public String getManager() { return manager; }
    public void setManager(String manager) { this.manager = manager; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getStatusType() { return statusType; }
    public void setStatusType(String statusType) { this.statusType = statusType; }
    public String getFee() { return fee; }
    public void setFee(String fee) { this.fee = fee; }
}
