# Retriable in PowerShell
This is loosely inspired by https://github.com/kamui/retriable but much simpler (yet handy!). Implements configurable retries (normally you would want [exponential backoff](http://en.wikipedia.org/wiki/Exponential_backoff)) and a list of "fatal" error codes that are immediately terminating (if used with WebRequest-like stuff such as Invoke-WebRequest or Invoke-RestMethod).

# Usage
```
$result = Run-Retriable -Command {
    # something that may fail or be throttled
    # e.g.: Invoke-RestMethod -Uri "https://api.ipify.org?format=json"      
}
```
