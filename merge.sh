#!/bin/bash

# Hedef XML dosyası
xml_dosyasi="output.xml"

# Klasördeki HTML dosyalarının yolu
html_klasoru="./"

# XML dosyasının başlangıcı
echo '<?xml version="1.0" encoding="UTF-8"?>' > $xml_dosyasi
echo '<rss version="2.0"' >> $xml_dosyasi
echo '    xmlns:excerpt="http://wordpress.org/export/1.2/excerpt/"' >> $xml_dosyasi
echo '    xmlns:content="http://purl.org/rss/1.0/modules/content/"' >> $xml_dosyasi
echo '    xmlns:wfw="http://wellformedweb.org/CommentAPI/"' >> $xml_dosyasi
echo '    xmlns:dc="http://purl.org/dc/elements/1.1/"' >> $xml_dosyasi
echo '    xmlns:wp="http://wordpress.org/export/1.2/">' >> $xml_dosyasi
echo '' >> $xml_dosyasi
echo '    <channel>' >> $xml_dosyasi
echo '        <title>title</title>' >> $xml_dosyasi
echo '        <link>http://localhost:3131</link>' >> $xml_dosyasi
echo '        <description></description>' >> $xml_dosyasi
echo '        <pubDate>Fri, 01 Sep 2023 12:38:14 +0000</pubDate>' >> $xml_dosyasi
echo '        <language>en-US</language>' >> $xml_dosyasi
echo '        <wp:wxr_version>1.2</wp:wxr_version>' >> $xml_dosyasi
echo '        <wp:base_site_url>http://localhost:3131</wp:base_site_url>' >> $xml_dosyasi
echo '        <wp:base_blog_url>http://localhost:3131</wp:base_blog_url>' >> $xml_dosyasi
echo '' >> $xml_dosyasi
echo '        <wp:author>' >> $xml_dosyasi
echo '            <wp:author_id>1</wp:author_id>' >> $xml_dosyasi
echo '            <wp:author_login><![CDATA[username]]></wp:author_login>' >> $xml_dosyasi
echo '            <wp:author_email><![CDATA[0aeon0@mail.com]]></wp:author_email>' >> $xml_dosyasi
echo '            <wp:author_display_name><![CDATA[username]]></wp:author_display_name>' >> $xml_dosyasi
echo '            <wp:author_first_name><![CDATA[]]></wp:author_first_name>' >> $xml_dosyasi
echo '            <wp:author_last_name><![CDATA[]]></wp:author_last_name>' >> $xml_dosyasi
echo '        </wp:author>' >> $xml_dosyasi

# Klasördeki her HTML dosyasını işleyin

for html_dosyasi in $html_klasoru/*.html
do
    dosya_adi=$(basename "$html_dosyasi" .html)  # Dosya adını al
    echo '        <item>' >> $xml_dosyasi
    echo "            <title><![CDATA[$dosya_adi]]></title>" >> $xml_dosyasi
    echo "            <link>http://localhost:3131/?bpb_pattern=$dosya_adi</link>" >> $xml_dosyasi
    echo '            <pubDate>Fri, 01 Sep 2023 12:38:06 +0000</pubDate>' >> $xml_dosyasi
    echo '            <dc:creator><![CDATA[username]]></dc:creator>' >> $xml_dosyasi
    echo "            <guid isPermaLink=\"false\">http://localhost:3131/?post_type=bpb_pattern&#038;p=$dosya_adi</guid>" >> $xml_dosyasi
    echo '            <description></description>' >> $xml_dosyasi
    echo -n '            <content:encoded><![CDATA[<!-- wp:html -->' >> $xml_dosyasi
    # Burada HTML içeriğini CDATA içinde <content:encoded> etiketi olarak ekliyoruz
    cat $html_dosyasi >> $xml_dosyasi
    echo '<!-- /wp:html -->]]></content:encoded>' >> $xml_dosyasi
    echo '            <excerpt:encoded><![CDATA[]]></excerpt:encoded>' >> $xml_dosyasi
    echo "            <wp:post_id>$dosya_adi</wp:post_id>" >> $xml_dosyasi
    echo '            <wp:post_date><![CDATA[2023-09-01 12:38:06]]></wp:post_date>' >> $xml_dosyasi
    echo '            <wp:post_date_gmt><![CDATA[2023-09-01 12:38:06]]></wp:post_date_gmt>' >> $xml_dosyasi
    echo '            <wp:post_modified><![CDATA[2023-09-01 12:38:06]]></wp:post_modified>' >> $xml_dosyasi
    echo '            <wp:post_modified_gmt><![CDATA[2023-09-01 12:38:06]]></wp:post_modified_gmt>' >> $xml_dosyasi
    echo '            <wp:comment_status><![CDATA[closed]]></wp:comment_status>' >> $xml_dosyasi
    echo '            <wp:ping_status><![CDATA[closed]]></wp:ping_status>' >> $xml_dosyasi
    echo "            <wp:post_name><![CDATA[$dosya_adi]]></wp:post_name>" >> $xml_dosyasi
    echo '            <wp:status><![CDATA[publish]]></wp:status>' >> $xml_dosyasi
    echo '            <wp:post_parent>0</wp:post_parent>' >> $xml_dosyasi
    echo '            <wp:menu_order>0</wp:menu_order>' >> $xml_dosyasi
    echo '            <wp:post_type><![CDATA[wp_block]]></wp:post_type>' >> $xml_dosyasi
    echo '            <wp:post_password><![CDATA[]]></wp:post_password>' >> $xml_dosyasi
    echo '            <wp:is_sticky>0</wp:is_sticky>' >> $xml_dosyasi
    echo '														<wp:postmeta>' >> $xml_dosyasi
    echo '		<wp:meta_key><![CDATA[wp_pattern_sync_status]]></wp:meta_key>' >> $xml_dosyasi
    echo '		<wp:meta_value><![CDATA[unsynced]]></wp:meta_value>' >> $xml_dosyasi
    echo '		</wp:postmeta>' >> $xml_dosyasi
    echo '        </item>' >> $xml_dosyasi
done

# XML dosyasının sonunu oluşturun
echo '    </channel>' >> $xml_dosyasi
echo '</rss>' >> $xml_dosyasi

echo "HTML dosyaları XML dosyasına başarıyla eklenmiş ve RSS akışı oluşturulmuştur: $xml_dosyasi"
