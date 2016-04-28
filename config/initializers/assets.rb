# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( development.svg )
Rails.application.config.assets.precompile += %w( external-m.svg )
Rails.application.config.assets.precompile += %w( mentor.svg )
Rails.application.config.assets.precompile += %w( mvp.svg )
Rails.application.config.assets.precompile += %w( pair-p.svg )
Rails.application.config.assets.precompile += %w( responsive.svg )
Rails.application.config.assets.precompile += %w( ruby_on_r.svg )
Rails.application.config.assets.precompile += %w( team_m.svg )
Rails.application.config.assets.precompile += %w( ui.svg )
Rails.application.config.assets.precompile += %w( refactorit_v.svg )
Rails.application.config.assets.precompile += %w( development.svg )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
