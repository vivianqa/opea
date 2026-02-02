*** Variables ***

${BROWSER}               chrome
${TIMEOUT_PADRAO}        10s
${URL_BASE}              https://sso.opea-uat.solutions
${URL_CADASTRO}          ${URL_BASE}/account/signup
${URL_ACESSO}            ${URL_BASE}/realms/opea/protocol/openid-connect/auth?approval_prompt=force&client_id=oauth2-proxy&redirect_uri=https%3A%2F%2Fauth.opea-uat.solutions%2Foauth2%2Fcallback&response_type=code&scope=openid+email+profile&state=gM-Gz_sUsaQeXNRZSCNpxIHTC5ry3AYw2rp7NpkwfcI%3Ahttps%3A%2F%2Fsso.opea-uat.solutions%2Faccount%2F
