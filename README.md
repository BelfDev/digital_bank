## Troubleshooting

### Permission denied eror when running `make setup` or `make setup-and-run`

As the prompt suggests, you're lacking permissions to execute the setup script file. To fix that, run the command below from the root directory of the workspace.

```
chmod 755 bin/setup_project.sh 
```