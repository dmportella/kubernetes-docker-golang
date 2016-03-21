package main;

type ApiStatus struct {
    Status string `json:"status"`
    Version string `json:"version"`
    Environment string `json:"environment"`
}