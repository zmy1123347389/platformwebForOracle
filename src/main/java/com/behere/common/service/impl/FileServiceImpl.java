package com.behere.common.service.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.behere.common.config.BootdoConfig;
import com.behere.common.dao.FileDao;
import com.behere.common.domain.FileDO;
import com.behere.common.service.FileService;
import com.behere.common.utils.IdWorker;


@Service
public class FileServiceImpl implements FileService {
	@Autowired
	private FileDao fileMapper;

	@Autowired
	private BootdoConfig bootdoConfig;
	@Override
	public FileDO get(String id){
		return fileMapper.get(id);
	}
	
	@Override
	public List<FileDO> list(Map<String, Object> map){
		return fileMapper.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return fileMapper.count(map);
	}
	
	@Override
	public int save(FileDO sysFile){
		sysFile.setId(IdWorker.generateSnowFlakeId());
		return fileMapper.save(sysFile);
	}
	
	@Override
	public int update(FileDO sysFile){
		return fileMapper.update(sysFile);
	}
	
	@Override
	public int remove(String id){
		return fileMapper.remove(id);
	}
	
	@Override
	public int batchRemove(String[] ids){
		return fileMapper.batchRemove(ids);
	}

    @Override
    public Boolean isExist(String url) {
		Boolean isExist = false;
		if (!StringUtils.isEmpty(url)) {
			String filePath = url.replace("/files/", "");
			filePath = bootdoConfig.getUploadPath() + filePath;
			File file = new File(filePath);
			if (file.exists()) {
				isExist = true;
			}
		}
		return isExist;
	}
	}
