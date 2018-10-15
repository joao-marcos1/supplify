# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe '#index' do
    render_views

    before do
      create(:blog)
      @tag = create(:tag)
      @tag.contents << create(:article)
    end

    it 'works' do
      get 'index'
    end
  end

  describe 'showing tag "foo"' do
    render_views

    let!(:blog) { create(:blog) }
    let(:parsed_body) { Capybara.string(response.body) }

    before do
      create(:tag, name: 'foo', contents: [create(:article)])
      get 'show', params: { id: 'foo' }
    end

    it 'has good rss feed link in head' do
      rss_link = parsed_body.find "head>link[href='http://test.host/tag/foo.rss']", visible: false
      aggregate_failures do
        expect(rss_link['rel']).to eq 'alternate'
        expect(rss_link['type']).to eq 'application/rss+xml'
        expect(rss_link['title']).to eq 'RSS'
      end
    end

    it 'has good atom feed link in head' do
      atom_link = parsed_body.find "head>link[href='http://test.host/tag/foo.atom']", visible: false
      aggregate_failures do
        expect(atom_link['rel']).to eq 'alternate'
        expect(atom_link['type']).to eq 'application/atom+xml'
        expect(atom_link['title']).to eq 'Atom'
      end
    end

    it 'has a canonical URL' do
      expect(response.body).to have_selector("head>link[href='#{blog.base_url}/tag/foo']", visible: false)
    end
  end

  describe 'password protected article' do
    render_views

    it 'article in tag should be password protected' do
      create(:blog)
      article = create(:article, password: 'password')
      create(:tag, name: 'foo', contents: [article])
      get 'show', params: { id: 'foo' }
      assert_select('input[id="article_password"]')
    end
  end
end
