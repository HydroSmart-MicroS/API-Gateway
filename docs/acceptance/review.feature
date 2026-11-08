# Acceptance specification. Automated evidence: tests/integration/secrets-http.cjs
@operacion
Feature: Check that Caddy is responding

  Scenario: Authorized or healthy request
    Given the local Gateway is running
    When the client requests GET /health
    Then the response status is 200
    And the body reports that Gateway is running

  Scenario: Boundary or access control
    Given the review environment is available
    When the client requests GET /.env
    Then the response status is 404
    And the hidden file is not disclosed
