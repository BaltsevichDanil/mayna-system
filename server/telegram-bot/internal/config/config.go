package config

import (
	"os"
)

type Config struct {
	Logger   Logger
	BotToken string
}

// Logger config
type Logger struct {
	LogDevelopment       bool
	LogDisableCaller     bool
	LogDisableStacktrace bool
	LogEncoding          string
	LogLevel             string
}

func LoadConfig() (config *Config, err error) {
	config = &Config{
		BotToken: os.Getenv("BOT_TOKEN"),
		Logger: Logger{
			LogDevelopment:       os.Getenv("LOG_DEVELOPMENT") == "true",
			LogDisableCaller:     os.Getenv("LOG_DISABLE_CALLER") == "true",
			LogDisableStacktrace: os.Getenv("LOG_DISABLE_STACKTRACE") == "true",
			LogEncoding:          os.Getenv("LOG_ENCODING"),
			LogLevel:             os.Getenv("LOG_LEVEL"),
		},
	}
	return
}
