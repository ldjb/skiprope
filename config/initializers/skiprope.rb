$skiprope = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

$skiprope["GIT_REV"] = `git rev-parse --short HEAD`

$skiprope["GIT_CONTRIBUTORS"] = `git shortlog -ens --after="2015-03-27 21:40:10"`.scan /\t(.*)\s<(.*)>$/m

Rails.application.config.skiprope = $skiprope
