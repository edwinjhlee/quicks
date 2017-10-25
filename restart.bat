bash -c "while true; do sleep 1s; if redis-cli get shutdown | grep -q 1; then echo shutdown; exit; else echo not; fi; done"
