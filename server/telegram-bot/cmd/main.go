package main

import (
	"log"

	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
	"github.com/totdlinnyy1/internal/config"
	"github.com/totdlinnyy1/internal/logger"
)

func main() {

	log.Println("Starting telegram bot")

	cfg, err := config.LoadConfig()
	if err != nil {
		log.Fatalf("LoadConfig: %v", err)
	}

	appLogger := logger.NewApiLogger(cfg)

	appLogger.InitLogger()

	appLogger.Infof("Bot token - %s", cfg.BotToken)

	bot, err := tgbotapi.NewBotAPI(cfg.BotToken)
	if err != nil {
		appLogger.Fatal(err)
	}

	appLogger.Infof("Bot: %s started", bot.Self.UserName)

	u := tgbotapi.NewUpdate(0)
	u.Timeout = 60

	updates := bot.GetUpdatesChan(u)

	for update := range updates {
		if update.Message != nil { // If we got a message

			msg := tgbotapi.NewMessage(update.Message.Chat.ID, update.Message.Text)
			msg.ReplyToMessageID = update.Message.MessageID

			bot.Send(msg)
		}
	}
}
