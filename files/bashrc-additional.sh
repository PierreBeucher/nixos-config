if [ -n "${NOVOPS_CURRENT_ENVIRONMENT:-}" ] ; then
    if [ "${NOVOPS_CURRENT_ENVIRONMENT}" = "prod" ] || [ "${NOVOPS_CURRENT_ENVIRONMENT}" = "production" ] ; then 
        PS1="\033[1;31m($NOVOPS_CURRENT_ENVIRONMENT)\033[0m$PS1"
    else
        PS1="\033[0;32m($NOVOPS_CURRENT_ENVIRONMENT)\033[0m$PS1"
    fi
fi