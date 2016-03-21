package main

import (
    "fmt"
    "html"
    "log"
    "net/http"
    "os"
    "encoding/json"
    "time"

    "github.com/gorilla/mux"
)

var binding = os.Getenv("BINDING")    
var environment = os.Getenv("ENVIRONMENT")
var errorOn500 = false
var timeout = false
var killProcess = false

func main() {
    if len(binding) == 0 {
        binding = ":8080"
    }
    
    if len(environment) == 0 {
        environment = "development"
    }
    
    router := mux.NewRouter().StrictSlash(true)
    router.HandleFunc("/", Index)
    router.HandleFunc("/__health", Health)
    router.HandleFunc("/__health/throw500", HealthThrow)
    router.HandleFunc("/__health/timeout", HealthTimeout)
    router.HandleFunc("/__health/killprocess", HealthKillProcess)
        
    log.Printf("(env = %q, port %q)", binding, environment)
    
    log.Fatal(http.ListenAndServe(binding, router))
}

func Index (w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, %q (env = %q, port %q)", html.EscapeString(r.URL.Path), environment, binding)
}

func Health (w http.ResponseWriter, r *http.Request) {
	if killProcess {
		os.Exit(1)
	}

	if errorOn500 {
		http.Error(w, "some 500 error", 500)
		return
	}

	if timeout {
		time.Sleep(120 * time.Second)
		return
	}

	var apiStatus = ApiStatus {
		Status: "OK",
		Version: "1.0.1",
		Environment: environment,
	}

	json.NewEncoder(w).Encode(apiStatus)
}

func HealthThrow (w http.ResponseWriter, r *http.Request) {
	errorOn500 = true

	fmt.Fprintln(w, "OK")
}

func HealthTimeout (w http.ResponseWriter, r *http.Request) {
	timeout = true

	fmt.Fprintln(w, "OK")
}

func HealthKillProcess (w http.ResponseWriter, r *http.Request) {
	killProcess = true

	fmt.Fprintln(w, "OK")
}