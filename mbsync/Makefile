CWD = $(shell pwd)

clean:
	systemctl --user stop mbsync.timer
	systemctl --user disable mbsync.timer
	systemctl --user stop mbsync.service
	systemctl --user disable mbsync.service

service:
	@echo "[Unit]\nDescription=mbsync\n\n[Service]\nExecStart=$(CWD)/mbsync.sh" > mbsync.service

mail_dir:
	@for i in $(find ./accounts -mindepth 1 -maxdepth 1 -type f -not -name "example"); do \
		mkdir ~/.mail/$(basename $i); \
	done 

timer:
	ln -s "$(CWD)/mbsync.timer" ~/.config/systemd/user/mbsync.timer
	ln -s "$(CWD)/mbsync.service" ~/.config/systemd/user/mbsync.service

start:
	systemctl --user enable mbsync.timer
	systemctl --user start mbsync.timer

init: service timer start
