run "setup_tests" {
    command = plan
    module {
        source = "./tests/setup"
    }
}