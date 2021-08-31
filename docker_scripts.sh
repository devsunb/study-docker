# 실행 중인 GitLab 컨테이너 삭제
docker stop gitlab && docker rm gitlab

# GitLab 최신 이미지 Pull
docker pull gitlab/gitlab-ce

# GitLab 시작
docker run -d \
  -p 9080:80 -p 9022:22 \
  -v /volume2/docker/gitlab/config:/etc/gitlab \
  -v /volume2/docker/gitlab/logs:/var/log/gitlab \
  -v /volume2/docker/gitlab/data:/var/opt/gitlab \
  --hostname jslee.me \
  --name gitlab \
  --restart always \
  gitlab/gitlab-ce:latest

# GitLab Gmail SMTP 설정
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.gmail.com"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "devsunb@gmail.com"
gitlab_rails['smtp_password'] = "<smtp_password>"
gitlab_rails['smtp_domain'] = "smtp.gmail.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = true
gitlab_rails['smtp_openssl_verify_mode'] = 'peer'

# Torrssen2 시작
docker run -d --name torrssen2 -p 9999:8080 -v /volume2/docker/torrssen2:/root/data tarpha/torrssen2

# Grafana
docker pull grafana/grafana
docker stop grafana && docker rm grafana
docker run -d \
  -p 13000:3000 \
  -v /volume2/docker/grafana:/var/lib/grafana \
  --name=grafana \
  --link=mysql \
  grafana/grafana
