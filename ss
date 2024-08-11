                                document.addEventListener('DOMContentLoaded', function () {
                                    function fetchDataAndPopulate(url, containerId) {
                                         fetch(url)
                                            .then(response => response.json())
                                            .then(data => {
                                                const container = document.getElementById(containerId);
                                                data.forEach(entry => {
                                                    const entryItem = document.createElement('div');
                                                    entryItem.classList.add('row', 'position-relative', 'entry-item');

                                                    let entryContent = '';
                                                    if (containerId !== 'pills-home') {
                                                        entryContent = `
                                                            <div class="col-1 position-relative">
                                                                <div class="border-left"></div>
                                                                <div class="dot"></div>
                                                            </div>
                                                            <div class="col-11">
                                                                <div class="mt-4 pt-2">
                                                                    <h5>${entry.title}</h5>
                                                                    <p class="text-muted fs-15">${entry.date}</p>
                                                                    <p class="text-muted fs-15">${entry.description}</p>
                                                                </div>
                                                            </div>
                                                        `;
                                                    } else {
                                                        entryContent = `
                                                            <div class="d-flex justify-content-between">
                                                                <h6>${entry.name}</h6>
                                                                <h6>${entry.percentage}%</h6>
                                                            </div>
                                                            <div class="progress" style="height: 5px;">
                                                                <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="${entry.percentage}" aria-valuemin="0" aria-valuemax="100" style="width: ${entry.percentage}%;"></div>
                                                            </div>
                                                        `;
                                                    }
                                                    entryItem.innerHTML = entryContent;
                                                    container.appendChild(entryItem);
                                                });
                                            })
                                            .catch(error => {
                                                console.error(`Error fetching ${url}:`, error);
                                            });
                                    }

                                    fetch('./json/skills.json')
                                        .then(response => response.json())
                                        .then(data => {
                                            const skillsContainer = document.getElementById('pills-home');
                                            data.forEach(skill => {
                                                const skillItem = document.createElement('div');
                                                skillItem.classList.add('skill-item', 'mt-4', 'pt-2');

                                                const skillContent = `
                                                    <div class="d-flex justify-content-between">
                                                        <h6>${skill.name}</h6>
                                                        <h6>${skill.percentage}%</h6>
                                                    </div>
                                                    <div class="progress" style="height: 5px;">
                                                        <div class="progress-bar bg-warning" role="progressbar" aria-valuenow="${skill.percentage}" aria-valuemin="0" aria-valuemax="100" style="width: ${skill.percentage}%;"></div>
                                                    </div>
                                                `;
                                                skillItem.innerHTML = skillContent;
                                                skillsContainer.appendChild(skillItem);
                                            });
                                        })
                                        .catch(error => {
                                            console.error('Error fetching skills JSON:', error);
                                        });                    
                                    fetchDataAndPopulate('./json/experience.json', 'pills-profile');
                                    fetchDataAndPopulate('./json/education.json', 'pills-contact');
                                });