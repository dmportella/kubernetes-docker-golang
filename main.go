package main

import (
    "fmt"
    "html"
    "log"
    "net/http"
    "os"
    
    "github.com/gorilla/mux"
)

var binding = os.Getenv("BINDING")    
var environment = os.Getenv("ENVIRONMENT")

func main() {
    if len(binding) == 0 {
        binding = ":8000"
    }
    
    if len(environment) == 0 {
        environment = "development"
    }
    
    router := mux.NewRouter().StrictSlash(true)
    router.HandleFunc("/", Index)
        
    log.Printf("(env = %q, port %q)", binding, environment)
    
    log.Fatal(http.ListenAndServe(binding, router))
}

func Index (w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, %q (env = %q, port %q)", html.EscapeString(r.URL.Path), environment, binding)
}