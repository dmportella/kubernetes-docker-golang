package main

import (
    "fmt"
    "html"
    "log"
    "net/http"
    "os"
)

func main() {
    var binding = os.Getenv("BINDING")    
    var environment = os.Getenv("ENVIRONMENT")
    
    if len(binding) == 0 {
        binding = ":8000"
    }
    
    if len(environment) == 0 {
        environment = "development"
    }
    
    log.Printf("(env = %q, port %q)", binding, environment)
    
    http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, %q (env = %q, port %q)", html.EscapeString(r.URL.Path), environment, binding)
    })

    log.Fatal(http.ListenAndServe(binding, nil))
}