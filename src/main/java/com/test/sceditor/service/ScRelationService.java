package com.test.sceditor.service;


import com.test.sceditor.entity.ScRelation;
import com.test.sceditor.repository.ScRelationRepository;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Service
public class ScRelationService {

    private String pathToExamples = "/home/yourmind/IdeaProjects/kp/sc-data/src/main/webapp/resources/example";

    @Autowired
    ScRelationRepository scRelationRepository;

    private String getStringFromFile(MultipartFile file) {
        String content = "";
        try {
            content = new String(file.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return content;
    }

    public List<ScRelation> parseRelationScsFile(MultipartFile file) {
        Pattern p = Pattern.compile("(\\w+)\\s*<-\\s*(sc_node_norole_relation;;)\\s*\n" +
                "(\\w)+\\s*=>\\s*(nrel_main_idtf:)\\s*\n" +
                "\\[\\s*(([а-яА-я]+)(\\s+[а-яА-я]+)*)\\s*\\*\\s*\\] \\s*\\(\\s*\\*\\s*<-\\s*lang_ru;;\\s*\\*\\s*\\)\\s*;;\\s*\n" +
                "(\\w)+\\s*=>\\s*(nrel_main_idtf:)\\s*\n" +
                "\\[\\s*(([a-zA-z]+)(\\s+[a-zA-z]+)*)\\s*\\*\\s*\\] \\s*\\(\\s*\\*\\s*<-\\s*lang_en;;\\s*\\*\\s*\\)\\s*;;\\s*");

        String content = getStringFromFile(file);
        List<ScRelation> parsedRelations = new ArrayList<>();
        Matcher matcher = p.matcher(content);
        while (matcher.find()) {
            ScRelation rel = new ScRelation(matcher.group(1), matcher.group(5), matcher.group(10));
            parsedRelations.add(rel);
        }
        return parsedRelations;
    }

    public String createTerm(String notionName, Map<String, String> notionAttr) {

        String output = "";
        for (Map.Entry<String, String> relation : notionAttr.entrySet()) {
            if(!relation.getValue().equals("")){
                output += toScs(notionName, relation.getKey(), relation.getValue()) + "\n";
            }
        }
        return output;
    }

    private String toScs(String termName, String rel, String val) {
        return String.format("%s => %s: [%s];;", termName, rel, val);
    }

    public List<ScRelation> getAll() {
        return scRelationRepository.findAll();
    }

    public ArrayList<String> getExamples() throws Exception {
        ArrayList examples = new ArrayList();
        File myFolder = new File(pathToExamples);
        File[] files = myFolder.listFiles();
        for (File file : files) {
            examples.add(file.getName());
        }
        return examples;
    }

    public MultipartFile getExistTemlate(String fileName) throws IOException {
        File file = new File(pathToExamples + "/" + fileName);
        FileInputStream input = new FileInputStream(file);
        MultipartFile multipartFile = new MockMultipartFile("file",
                file.getName(), "text/plain", IOUtils.toByteArray(input));
        return multipartFile;
    }

}
