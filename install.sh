# Homebrew 설치 여부 확인
if ! which brew
then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# 스크립트 내에서 일부 sudo 권한이 필요한 명령을 수행하기 위해 root 패스워드를 입력
# sudo 권한이 필요한 이유 : cask로 설치한 애플리케이션을 바로 실행하기 위해 다운로드 된 파일에 대한 격리 속성 제거 작업
read -r -s -p "[sudo] sudo password for $(whoami):" pass

# BrewFile 실행 명령어
brew bundle

# cask로 다운로드시 웹에서 다운로드한 것과 동일하기 때문에 실행을 하면 Security 문제로 실행되지 않음
# cask로 설치한 애플리케이션을 바로 실행하기 위해 다운로드 된 파일에 대한 격리 속성 제거 작업 명령어
sudo xattr -dr com.apple.quarantine /Applications/Google\ Chrome.app
sudo xattr -dr com.apple.quarantine /Applications/Alfred\ 4.app
sudo xattr -dr com.apple.quarantine /Applications/AppCleaner.app
sudo xattr -dr com.apple.quarantine /Applications/Adobe\ Acrobat\ Reader\ DC.app
sudo xattr -dr com.apple.quarantine /Applications/Adobe\ Creative\ Cloud.app
sudo xattr -dr com.apple.quarantine /Applications/Keka.app
sudo xattr -dr com.apple.quarantine /Applications/Karabiner-Elements.app
sudo xattr -dr com.apple.quarantine /Applications/zoom.us.app
sudo xattr -dr com.apple.quarantine /Applications/Spectacle.app

# 설치 성공 완료 메시지
printf '\n install success! \n'
