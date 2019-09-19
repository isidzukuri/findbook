# frozen_string_literal: true

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin

    initializer 'admin.append_migrations' do |app|
      unless app.root.to_s == root.to_s
        config.paths['db/migrate'].expanded.each do |path|
          app.config.paths['db/migrate'].push(path)
        end
      end
    end

    config.to_prepare do
      Devise::SessionsController.layout "layout_for_sessions_controller"
    end
  end
end
