# name: discourse-polarsteps-onebox
# about: Transforme les liens de voyage Polarsteps en cartes interactives (Onebox)
# version: 1.0
# authors: Stylevan Club
# url: https://github.com/votre-compte/discourse-polarsteps-onebox

enabled_site_setting :polarsteps_onebox_enabled

register_asset "../stylesheets/polarsteps-onebox.scss"

after_initialize do
  # On crée un moteur de Onebox personnalisé pour Polarsteps
  class Onebox::Engine::PolarstepsOnebox
    include Onebox::Engine

    # Ce plugin s'active dès qu'un lien correspond à un voyage Polarsteps
    # Exemple : https://www.polarsteps.com/NomUser/123456-titre-du-voyage
    REGEXP = /^https?:\/\/(?:www\.)?polarsteps\.com\/[^\/]+\/([0-9]+)/

    matches_regexp REGEXP

    def to_html
      # On extrait l'ID du voyage depuis l'URL
      trip_id = match[1]
      
      # On génère l'iframe officielle d'intégration de Polarsteps
      <<-HTML
        <div class="polarsteps-onebox-container">
          <iframe 
            src="https://www.polarsteps.com/embed/v2/trip/#{trip_id}" 
            width="100%" 
            height="600" 
            frameborder="0" 
            style="border:0; border-radius:12px; width:100%; height:600px;" 
            allowfullscreen>
          </iframe>
        </div>
      HTML
    end
  end
end
