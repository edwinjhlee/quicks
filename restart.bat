bash -c "while true; do sleep 1s; if redis-cli get shutdown | grep -q 1; then redis-cli set shutdown 0; echo shutdown; exit; else echo not; fi; done"

redis-cli psetex shutdown 3000 1




