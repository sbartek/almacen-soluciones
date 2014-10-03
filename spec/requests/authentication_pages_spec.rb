# -*- coding: utf-8 -*-
require 'rails_helper'

describe "Authentication" do

  subject { page }

  describe "'Accede' page" do
    before { visit signin_path }

    it { should have_content('Inicia sesión') }
    it { should have_title('Accede') }
  end

  describe "accede" do
    before { visit signin_path }
    
    describe "with invalid information" do
      before { click_button "Accede" }

      it { should have_title('Accede') }
      # it { should have_selector('div.alert.alert-error') }
    end

    describe "with valid information" do
      let(:usuario) { FactoryGirl.create(:usuario) }
      before do
        fill_in "Email",    with: usuario.email.upcase
        fill_in "Password", with: usuario.password
        click_button "Accede"
      end

      #it { should have_title(usuario.name) }
      it { should have_link('Perfil', href: usuario_path(usuario)) }
      it { should have_link('Cerrar sesión', href: signout_path) }
      it { should_not have_link('Accede', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Cerrar sesión" }
        it { should have_link('Accede') }
      end
    end

  end

end
